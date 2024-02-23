install:
	mkdir -p ~/.local/bin/quotem
	cp ./select_quote.py ~/.local/bin/quotem/select_quote.py
	mkdir -p ~/.local/share/quotem
	@if [ ! -f ~/.local/share/quotem/quotes.toml ]; then \
		cp ./quotes.toml ~/.local/share/quotem/quotes.toml; \
	fi
	mkdir -p ~/.config/conky
	@if [ ! -f ~/.config/conky/conky.conf ]; then \
		cp ./conky.conf ~/.config/conky/conky.conf; \
	else \
		echo "A conky-configuration already exists! Add configuration manually!"; \
	fi

uninstall:
	rm -r ~/.local/bin/quotem
	rm -r ~/.local/share/quotem
	echo "The conky-configuration was not removed. It still resides in ~/.config/conky."
