#ifndef ANIMAL_HPP
# define ANIMAL_HPP

# include <string>
# include <iostream>

class Animal {
	public:
		Animal(void);
		Animal(std::string name, std::string color);
		Animal(const Animal &src);
		~Animal(void);
		Animal	&operator=(const Animal &rhs);
		std::string	getName(void);
		std::string	getColor(void);

	private:
		std::string	name;
		std::string	color;
};

#endif
