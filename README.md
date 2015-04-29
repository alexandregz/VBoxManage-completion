VBoxManage-completion.bash
==========================

Simple bash completion for VBoxManage


Usage
-----

- Clone repo

```bash
alex@vostok:/Volumes/HD/dev$ git clone https://github.com/alexandregz/VBoxManage-completion
alex@vostok:/Volumes/HD/dev$ cd VBoxManage-completion/
```

- Copy/move/link VBoxManage-completion file to your completion files dir:

For example, with [Homebrew](https://github.com/homebrew/homebrew) bash-completion:
```
alex@vostok:/Volumes/HD/dev/VBoxManage-completion(master)$ ln -s $(pwd)/VBoxManage-completion.bash  /usr/local/etc/bash_completion.d/VBoxManage
```

- Reload your shell: `source ~/.bash_profile`
