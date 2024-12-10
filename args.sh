#!/bin/bash

declare -A dict

args=("$@")

extract_args()
{
  local key;
  local value;
  local item;
  local count=$#

  for ((i = 0 ; i < $count ; i++)); do
    
    item="${args[$i]}"    
    if [[ "$item" =~ ^- ]]; then
      # Key is the arg start with -
      key=$item
      
      # Value is the one right after key
      if (( $i < $count - 1 )); then
        value="${args[($i + 1)]}" 
      else 
        value=true 
      fi

      # If the value also start with -, that mean the current key does not has value (just a flag)
      if [[ "$value" =~ ^- ]]; then
        value=true 
      fi

      dict[$key]=$value
    fi
  done
}


find_argument()
{
  local key=$1
  local default=$2
  for k in "${!dict[@]}"; do
    if [[ "{$k}" = "{$key}" ]]; then
      echo "${dict[$k]}"
      return
    fi
  done
  echo $default
}

extract_args "$@"