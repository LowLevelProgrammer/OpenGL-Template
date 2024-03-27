#include "glad/glad.h"
#include <GLFW/glfw3.h>

int main() {
  // GLFW initialization code
  if (!glfwInit()) {
    return -1;
  }

  // Create a GLFW window
  GLFWwindow *window =
      glfwCreateWindow(800, 600, "OpenGL Window", nullptr, nullptr);
  if (!window) {
    glfwTerminate();
    return -1;
  }

  // Make the context current
  glfwMakeContextCurrent(window);

  // Initialize GLAD
  if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)) {
    return -1;
  }

  // Use OpenGL functions
  glClearColor(0.2f, 0.3f, 0.8f, 1.0f);
  glClear(GL_COLOR_BUFFER_BIT);

  // GLFW event loop
  while (!glfwWindowShouldClose(window)) {
    glfwSwapBuffers(window);
    glfwPollEvents();
  }

  // Cleanup
  glfwTerminate();
  return 0;
}
