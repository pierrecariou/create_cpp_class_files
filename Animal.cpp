#include "Animal.hpp"

Animal::Animal(void)
{
	std::cout << "Animal created" << std::endl;
	return ;
}

Animal::Animal(std::string name, std::string color) : name(name), color(color)
{
	std::cout << "Animal created" << std::endl;
	return ;
}

Animal::Animal(const Animal &src)
{
	*this = src;
	std::cout << "Animal copied" << std::endl;
	return ;
}

Animal::~Animal(void)
{
	std::cout << "Animal deleted" << std::endl;
	return ;
}

Animal	&Animal::operator=(const Animal &rhs)
{
	*this = rhs;
	std::cout << "Animal modified" << std::endl;
}

std::string	Animal::getName(void)
{
	return this->name;
}

std::string	Animal::getColor(void)
{
	return this->color;
}
