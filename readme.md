# Personal subjective VIM config

This is my personal vim config. If this helps anyone else, then awesome!

In order for this to work, you need the right font, use [Patched Powerline Fonts](https://github.com/powerline/fonts) for that.

## Usage

```bash
$ cd && git clone https://github.com/danazkari/vim-config
$ # After this is done, make symbolic links
$ ln -s ~/vim-config/.vimrc ~/.vimrc
$ ln -s ~/vim-config/.vim ~/.vim
```

After that's done, open up `vim` (will sort of fail at first but just continue) and type `:PlugInstall`, this will install all of the plugins.

Close vim and then enter it again, it should look pretty rad.

## Typescript support
For typescript support, please install the `typescript` npm package globally:
```bash
$ npm install -g typescript
```

Then, inside of `vim` run `:VimProcInstall`. Restar the editor and you should be good to go!

That's it, go for a cup of coffee and hack hack hackity hack McHack.

![This is how it looks now](http://res.cloudinary.com/danazkari/image/upload/v1458244829/7BkOG_kqrnse.png)
