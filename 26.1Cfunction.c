#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <math.h>

lua_State *L;

void error(lua_State *L, const char *fmt, ...) {
    va_list argp;
    va_start(argp, fmt);
    vfprintf(stderr, fmt, argp);
    va_end(argp);
    lua_close(L);
    exit(EXIT_FAILURE);
}

static int l_sin (lua_State *L) {
    double d = lua_tonumber(L, 1);
    lua_pushnumber(L, sin(d));
    return 1;
}

static int l_sin2 (lua_State *L) {
    double d = luaL_checknumber(L, 1);
    lua_pushnumber(L, sin(d));
    return 1;
}

double f (double x) {
    double z;
    /* push functions and arguments */
    lua_getglobal(L, "f"); /* function to be called */
    lua_pushnumber(L, x); /* push 1st argument */
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
    lua_pushcfunction(L, l_sin2);
    lua_setglobal(L, "mysin");

    if (luaL_loadfile(L, "26.1useCfinction.lua") || lua_pcall(L, 0, 0, 0))
        error(L, "cannot run configuration file: %s",
              lua_tostring(L, -1));

    double z = f(M_PI / 6);

    printf("z: %f\n", z);

    lua_close(L);

    return 0;
}