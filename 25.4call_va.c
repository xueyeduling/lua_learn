#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

lua_State *L;

void error(lua_State *L, const char *fmt, ...)
{
    va_list argp;
    va_start(argp, fmt);
    vfprintf(stderr, fmt, argp);
    va_end(argp);
    lua_close(L);
    exit(EXIT_FAILURE);
}

double f(double x, double y)
{
    double z;
    /* push functions and arguments */
    lua_getglobal(L, "f"); /* function to be called */
    lua_pushnumber(L, x);  /* push 1st argument */
    lua_pushnumber(L, y);  /* push 2nd argument */
    /* do the call (2 arguments, 1 result) */
    if (lua_pcall(L, 2, 1, 0) != 0)
        error(L, "error running function `f': %s",
              lua_tostring(L, -1));
    /* retrieve result */
    if (!lua_isnumber(L, -1))
        error(L, "function `f' must return a number");
    z = lua_tonumber(L, -1);
    lua_pop(L, 1); /* pop returned value */
    return z;
}

lua_State *load(char *filename)
{
    L = luaL_newstate();
    luaL_openlibs(L);
    if (luaL_loadfile(L, filename) || lua_pcall(L, 0, 0, 0))
        error(L, "cannot run configuration file: %s",
              lua_tostring(L, -1));
}

void call_va(const char *func, const char *sig, ...)
{
    va_list vl;
    int narg, nres; /* number of arguments and results */
    va_start(vl, sig);
    lua_getglobal(L, func); /* get function */
    /* push arguments */
    narg = 0;
    
    while (*sig)
    { /* push arguments */
        switch (*sig++)
        {
        case 'd': /* double argument */
            lua_pushnumber(L, va_arg(vl, int));
            break;
        case 'i': /* int argument */
            lua_pushnumber(L, va_arg(vl, int));
            break;
        case 's': /* string argument */
            lua_pushstring(L, va_arg(vl, char *));
            break;
        case '>':
            goto endwhile;
        default:
            error(L, "invalid option (%c)", *(sig - 1));
        }
        narg++;
        luaL_checkstack(L, 1, "too many arguments");
    }
    
endwhile:
    /* do the call */
    nres = strlen(sig);                   /* number of expected results */
    if (lua_pcall(L, narg, nres, 0) != 0) /* do the call */
        error(L, "error running function `%s': %s",
              func, lua_tostring(L, -1));
    /* retrieve results */
    int ind = -nres; /* stack index of first result */
    while (*sig)
    { /* get results */
        switch (*sig++)
        {
        case 'd': /* double result */
            if (!lua_isnumber(L, ind))
                error(L, "wrong result type");
            *va_arg(vl, double *) = lua_tonumber(L, ind);
            break;
        case 'i': /* int result */
            if (!lua_isnumber(L, ind))
                error(L, "wrong result type");
            *va_arg(vl, int *) = (int)lua_tonumber(L, ind);
            break;
        case 's': /* string result */
            if (!lua_isstring(L, ind))
                error(L, "wrong result type");
            *va_arg(vl, const char **) = lua_tostring(L, ind);
            break;
        default:
            error(L, "invalid option (%c)", *(sig - 1));
        }
        ind++;
    }
    
    lua_pop(L, nres);   // 退栈
    va_end(vl);
}

int main()
{
    load("25.3config.lua");

    double z = 0;
    
    call_va("f", "dd>d", 3, 4, &z);

    printf("z: %f\n", z);

    lua_close(L);
    return 0;
}