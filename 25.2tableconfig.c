#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>

#define MAX_COLOR 255
/* assume that table is on the stack top */
int getfield (const char *key, lua_State *L) {
    int result;
    lua_pushstring(L, key);
    lua_gettable(L, -2); /* get background[key] */
    if (!lua_isnumber(L, -1))
    error(L, "invalid component in background color");
    result = (int)lua_tonumber(L, -1) * MAX_COLOR;
    lua_pop(L, 1); /* remove number */
    return result;
} 

struct ColorTable {
    char *name;
    unsigned char red, green, blue;
}

colortable[] = {
    {"WHITE", MAX_COLOR, MAX_COLOR, MAX_COLOR},
    {"RED", MAX_COLOR, 0, 0},
    {"GREEN", 0, MAX_COLOR, 0},
    {"BLUE", 0, 0, MAX_COLOR},
    {"BLACK", 0, 0, 0},
    {NULL, 0, 0, 0} /* sentinel */
};

void load(char *filename, int *width, int *height, int *red, int *green, int *blue)
{
    lua_State *L = luaL_newstate();
    luaopen_base(L);
    luaopen_io(L);
    luaopen_string(L);
    luaopen_math(L);
    if (luaL_loadfile(L, filename) || lua_pcall(L, 0, 0, 0))
        error(L, "cannot run configuration file: %s",
              lua_tostring(L, -1));
    lua_getglobal(L, "width");
    lua_getglobal(L, "height");
    if (!lua_isnumber(L, -2))
        error(L, "`width' should be a number\n");
    if (!lua_isnumber(L, -1))
        error(L, "`height' should be a number\n");
    *width = (int)lua_tonumber(L, -2);
    *height = (int)lua_tonumber(L, -1);

    int i = 0;
    while (colortable[i].name != NULL)
        setcolor(&colortable[i++], L);

    lua_getglobal(L, "background");
    if (!lua_istable(L, -1))
    error(L, "`background' is not a valid color table");
    *red = getfield("r", L);
    *green = getfield("g", L);
    *blue = getfield("b", L);

    lua_getglobal(L, "background");
    if (lua_isstring(L, -1)) {
        const char *name = lua_tostring(L, -1);
        int i = 0;
        while (colortable[i].name != NULL &&
        strcmp(name, colortable[i].name) != 0)
        i++;
        if (colortable[i].name == NULL) /* string not found? */
        error(L, "invalid color name (%s)", name);
        else { /* use colortable[i] */
        red = colortable[i].red;
        green = colortable[i].green;
        blue = colortable[i].blue;
        }
    } else if (lua_istable(L, -1)) {
        red = getfield("r", L);
        green = getfield("g", L);
        blue = getfield("b", L);
    } else
        error(L, "invalid value for `background'");

    lua_close(L);
}

/* assume that table is at the top */
void setfield (const char *index, int value, lua_State *L) {
    lua_pushstring(L, index);
    lua_pushnumber(L, (double)value/MAX_COLOR);
    lua_settable(L, -3);
}

void setcolor (struct ColorTable *ct, lua_State *L) {
    lua_newtable(L); /* creates a table */
    setfield("r", ct->red, L); /* table.r = ct->r */
    setfield("g", ct->green, L); /* table.g = ct->g */
    setfield("b", ct->blue, L); /* table.b = ct->b */
    lua_setglobal(ct->name, L); /* 'name' = table */
}

int main() {
    int w = 0, h = 0, r = 0, g = 0, b = 0;
    load("iotest", &w, &h, &r, &g, &b);
    printf("w: %d, h: %d\nr: %d, h: %d, n: %d\n", w, h, r, g, b);
    return 0;
}