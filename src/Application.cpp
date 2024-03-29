#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <iostream>

int main()
{
	// Initializeing GLFW
	if (!glfwInit())
	{
		std::cout << "Unable to initialize GLFW!" << std::endl;
		return -1;
	}

	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);


	GLFWwindow* window = glfwCreateWindow(1280, 720, "Renderer", NULL, NULL);

	if (!window)
	{
		glfwTerminate();
		std::cout << "Unable to Create Window!" << std::endl;
		return -1;
	}

	glfwMakeContextCurrent(window);

	// Initializing OpenGL context 
	if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
	{
		std::cout << "Failed to initialize OpenGL context" << std::endl;
		return -1;
	}

	glViewport(0, 0, 640, 480);

	while (!glfwWindowShouldClose(window))
	{
		glClearColor(1.0f, 1.0f, 0.0f, 1.0f);
		glClear(GL_COLOR_BUFFER_BIT);
		glfwSwapBuffers(window);
		glfwPollEvents();
	}

	glfwTerminate();

	return 0;
}