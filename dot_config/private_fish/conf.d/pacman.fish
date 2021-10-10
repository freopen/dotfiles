function list-installed-pkgs
    paru -Qeq | sort | uniq
end

function list-required-pkgs
    cat $HOME/.config/paru/pkg_list.txt | sed -E 's/#.*$//' | string split -n ' ' | sort | uniq
end

function unpack-groups
    while read pkg
        if not paru -Qgq $pkg 2>/dev/null
            echo $pkg
        end
    end
end

function diff-pkgs
    comm -3 (list-required-pkgs | unpack-groups | sort | uniq | psub) (list-installed-pkgs | psub)
end
