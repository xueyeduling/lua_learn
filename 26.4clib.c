#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

// 示例函数
static int myfunction(lua_State *L) {
    printf("Hello from my C function!\n");
    return 0;  // 返回值的数量
}

// 库的打开函数
LUAMOD_API int luaopen_mylib(lua_State *L) {
    lua_register(L, "myfunction", myfunction);
    return 0;
}