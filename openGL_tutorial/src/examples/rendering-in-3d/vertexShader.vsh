#version 130

uniform mat4 mvpMatrix;

in vec4 vertex;

void main(void)
{
    gl_Position = mvpMatrix * vertex;
}
