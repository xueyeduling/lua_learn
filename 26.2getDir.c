#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <math.h>
#include <dirent.h>
#include <errno.h>

lua_State *L;

void error(lua_State *L, const char *fmt, ...) {
    va_list argp;
    va_start(argp, fmt);
    vfprintf(stderr, fmt, argp);
    va_end(argp);
    lua_close(L);
    exit(EXIT_FAILURE);
}

static int l_dir(lua_State *L)
{
    DIR *dir;
    struct dirent *entry;
    int i;
    const char *path = luaL_checkstring(L, 1);
    /* open directory */
    dir = opendir(path);
    if (dir == NULL)
    {                                       /* error opening the directory? */
        lua_pushnil(L);                     /* return nil and ... */
        //lua_pushstring(L, strerror(errno)); /* error message */
        return 2;                           /* number of results */
    }
    /* create result table */
    lua_newtable(L);
    i = 1;
    while ((entry = readdir(dir)) != NULL)
    {
        lua_pushnumber(L, i++);           /* push key */
        lua_pushstring(L, entry->d_name); /* push value */
        lua_settable(L, -3);
    }
    closedir(dir);
    return 1; /* table is already on top */
}

double f (char* x) {
    double z;
    /* push functions and arguments */
    lua_getglobal(L, "f"); /* function to be called */
    lua_pushstring(L, x); /* push 1st argument */
    /* do the call (2 arguments, 1 result) */
    if (lua_pcall(L, 1, 1, 0) != 0)
        error(L, "error running function `f': %s",
    lua_tostring(L, -1));
    /* retrieve result */
    if (!lua_isnumber(L, -1))
        error(L, "function `f' must return a number");
    z = lua_tonumber(L, -1);
    lua_pop(L, 1); /* pop returned value */
    return z;
}

int main() {
    L = luaL_newstate();
    luaL_openlibs(L);
    lua_pushcfunction(L, l_dir);
    lua_setglobal(L, "myl_dir");

    if (luaL_loadfile(L, "26.2useGetDir.lua") || lua_pcall(L, 0, 0, 0))
        error(L, "cannot run configuration file: %s",
              lua_tostring(L, -1));

    f("26.2dir");

    lua_close(L);

    return 0;
}