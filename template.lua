

-- package = { ... }

package.type = "pkgindex"
package.namespace = "awesome"

if not string.find(package.repo, ".git", 1, true) then
    package.repo = package.repo .. ".git"
end

import("xim.libxpkg.xvm")
import("xim.libxpkg.system")

local xim_datadir = path.directory(system.xpkgdir())
local indexrepos_json = path.join(xim_datadir, "xim-index-repos", "xim-indexrepos.json")

local pkgindex_repo_lists = {
    -- xlings official maintain
    xim = true,
    awesome = true,
    scode = true,
    fromsource = true,
    d2x = true,
    template = true,

    -- community maintain
    dragonos = false,

    -- personal maintain

}

function installed()

    if pkgindex_repo_lists[package.name] then 
        return true 
    end

    local old_value = xvm.log_tag(false)
    local ret = xvm.has(package.namespace .. "-" .. package.name)
    xvm.log_tag(old_value)
    return ret
end

function install()

    system.exec(string.format(
        "xim --add-indexrepo %s:%s",
        package.name, package.repo
    ))

    system.exec("xim --update index")

    local indexrepos_content = io.readfile(indexrepos_json)

    return string.find(indexrepos_content, package.repo, 1, true)
end

function uninstall()
    local indexrepos_content = io.readfile(indexrepos_json)
    local pkgindex_repo = string.format([["%s":"%s",]], package.name, package.repo)
    local new_indexrepos_content = indexrepos_content:replace(pkgindex_repo, "", { plain = true })
    xvm.remove(package.namespace .. "-" .. package.name)
    system.exec("xim --update index")
    return true
end