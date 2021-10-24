m = Map("gmediarender", translate("gmediarender server"))

s = m:section(TypedSection, "gmediarender", "")

s:tab("gmrender_set", translate("Basic setting"))
gmrenderbindiplist = s:taboption("gmrender_set", ListValue, "gmrenderbindiplist", translate("Binding ip list"))
gmrenderbindiplist.placeholder = "lan"
gmrenderbindiplist:value("lan", translate("lan"))
gmrenderbindiplist:value("wan", translate("wan"))
gmrenderbindiplist:value("other", translate("other"))
gmrenderbindiplist.default = "lan"
gmrenderbindiplist.rempty = false

gmrenderotherip = s:taboption("gmrender_set", Value, "gmrenderotherip", translate("Other ip"))
gmrenderotherip:depends("gmrenderbindiplist", "other")
gmrenderotherip.rmempty = true
gmrenderotherip.datatype = "ipaddr"
gmrenderotherip.description = translate("Please type ip address")

gmrendersuffix = s:taboption("gmrender_set", Value, "gmrendersuffix", translate("gmediarender friendly-name suffix"))
gmrendersuffix.datatype = "string"
gmrendersuffix.placeholder = "hello"
gmrendersuffix.default = "hello"
gmrendersuffix.rmempty = false


s:tab("gmrender_init", translate("Action"))
gmrenderinit = s:taboption("gmrender_init", Button, "gmrenderinit", translate("One-click initialize gmediarender"))
gmrenderinit.rmempty = true
gmrenderinit.inputstyle = "apply"
function gmrenderinit.write(self, section)
	luci.util.exec("/etc/init.d/gmediarender restart >/dev/null 2>&1 &")
end

return m