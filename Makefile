
NAME = HelloWorld
LIB_NAME = libmynative
JAVA_INCLUDE = /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.65-2.b17.el7_1.x86_64/include

CXX_SRCS = $(NAME).cpp
OBJS = $(NAME).class $(LIB_NAME).so
CXXFLAGS =  -W -Wall -Wextra -pedantic -std=c++0x -fPIC -O2 -I "$(JAVA_INCLUDE)" -I "$(JAVA_INCLUDE)/linux"

all: $(OBJS)
$(NAME): $(OBJS)

.SUFFIXES: .java .class

.java.class:
	javac $<

$(LIB_NAME).so: $(NAME).h $(NAME).cpp
	$(CXX) -shared $(CXXFLAGS) -o $(LIB_NAME).so $(NAME).cpp

$(NAME).h: $(NAME).class
	javah $(NAME)

.PHONY: clean
clean:
	$(RM) $(NAME).h $(OBJS)
