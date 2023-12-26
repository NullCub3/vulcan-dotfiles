#!/bin/bash
s="$(nvidia-settings -q CurrentMetaMode -t)"
nvidia-settings -a AllowFlipping=0

if [[ "${s}" != "" ]]; then
  s="${s#*" :: "}"
  nvidia-settings -a CurrentMetaMode="${s//\}/, ForceFullCompositionPipeline=On\}}"
fi
