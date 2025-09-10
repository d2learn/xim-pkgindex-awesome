

-- package = { ... }

package.type = "pkgindex"
package.namespace = "awesome"

package.xpm = {
    linux = { ["latest"] = { } },
    macos = { ["latest"] = { } },
    windows = { ["latest"] = { } },
}

if not string.find(package.repo, ".git", 1, true) then
    package.repo = package.repo .. ".git"
end

import("core.base.json")

import("xim.libxpkg.xvm")
import("xim.libxpkg.system")
import("xim.libxpkg.log")

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

    local indexrepos = json.loadfile(indexrepos_json)

    log.info("verify indexrepos file: %s...", indexrepos_json)

    return indexrepos[package.name]
end

function uninstall()
    local indexrepos = json.loadfile(indexrepos_json)
    indexrepos[package.name] = nil
    json.savefile(indexrepos_json, indexrepos)
    xvm.remove(package.namespace .. "-" .. package.name)
    system.exec("xim --update index")
    return not indexrepos[package.name]
end