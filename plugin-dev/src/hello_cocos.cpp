#include "hello_cocos.h"

Demo::Demo(const char *name):_name(name) {}

std::string Demo::hello(const char *message) {
    std::stringstream ss;
    ss << "Hello " << message << " from " << _name;
    return ss.str();
}
