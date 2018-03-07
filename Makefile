# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaylor <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/07 09:35:25 by jaylor            #+#    #+#              #
#    Updated: 2018/03/07 14:16:57 by jaylor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
NAME = get_next_line
HEADERS = includes

CFLAGS += -Wall -Werror -Wextra
CFLAGS += -I$(HEADERS)

FILESO =	src/get_next_line.o \

LIBFT_DIR = libft
LIBFT = $(LIBFT_DIR)/libftprintf.a

all: $(NAME)

$(NAME): $(FILESO) $(LIBFT)
	ar rc $(NAME) $^ 

%.o: srcs/%.c
	gcc -o $@ -c $< $(CFLAGS)

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)

clean:
	rm -f $(FILESO) 
	$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(NAME)
	$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all
