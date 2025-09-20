function bi
    if test (count $argv) -ne 1
        echo "Usage: bi <package_name>"
        return 1
    end

    set pkg $argv[1]

    ./xbps-src pkg $pkg
    and sudo xbps-install --repository=hostdir/binpkgs $pkg
end

