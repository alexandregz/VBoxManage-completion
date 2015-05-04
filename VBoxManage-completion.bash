#!/bin/bash
#
# bash completion file for VBoxManage 
#
# To enable the completions either:
#  - place this file in /etc/bash_completion.d
#  or
#  - copy this file to e.g. ~/.VBoxManage-completion.sh and add the line
#    below to your .bashrc after bash completion features are loaded
#    . ~/.VBoxManage-completion.sh
#

_VBoxManage_dhcpserver() {
        local options=(
                add
                modify
                remove
        )

        COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
}

_VBoxManage_list() {
        local options=(
                bridgedifs
                dhcpservers
                dvds
                extpacks
                floppies
                groups
                hddbackends
                hdds
                hostcpuids
                hostdvds
                hostfloppies
                hostinfo
                hostonlyifs
                intnets
                natnets
                ostypes
                runningvms
                systemproperties
                usbfilters
                usbhost
                vms
                webcams
        )

        COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
}

_VBoxManage() {
	local commands=(
                adoptstate
                bandwidthctl
                clonehd
                clonevm
                closemedium
                controlvm
                convertfromraw
                createhd
                createvm
                debugvm
                dhcpserver
                discardstate
                export
                extpack
                getextradata
                guestcontrol
                guestproperty
                hostonlyif
                import
                list
                metrics
                modifyhd
                modifyvm
                natnetwork
                registervm
                setextradata
                setproperty
                sharedfolder
                showhdinfo
                showvminfo
                snapshot
                startvm
                storageattach
                storagectl
                unregistervm
                usbfilter
	)


        COMPREPLY=()
        local cur
        local prev
        local first="${COMP_WORDS[0]}"
        _get_comp_words_by_ref -n : cur prev 

        case "$prev" in
                "$first")
                        COMPREPLY=( $( compgen -W "${commands[*]}" -- "$cur" ) )
                        ;;
                *)
                        for option in ${commands[*]}; do
                                if [ "$prev" == "$option" ]; then
                                        declare -F _VBoxManage_$option >/dev/null || return
                                        _VBoxManage_$option
                                fi
                        done
                        ;;
        esac

        return
}

complete -F _VBoxManage VBoxManage
