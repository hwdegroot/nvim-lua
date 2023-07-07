#!/bin/bash

rm $(dirname $0)/plugin/packer_compiled.lua -f
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
