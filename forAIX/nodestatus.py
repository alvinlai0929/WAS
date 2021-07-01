nodes=AdminConfig.getid('/Node:/').splitlines()
nodenames=[ AdminConfig.showAttribute(node,'name') for node in nodes ]
j2eeServerTuples=[]
for nodename in nodenames:
    serversString="/Node:%s/Server:/" % (nodename)
    servers=AdminConfig.getid(serversString).splitlines()
    for server in servers:
        if AdminConfig.showAttribute(server,'serverType') in ['APPLICATION_SERVER','DEPLOYMENT_MANAGER','NODE_AGENT'] :
            j2eeServerTuples.append( (nodename, AdminConfig.showAttribute(server,'name')) )

for (nodename,servername) in j2eeServerTuples:
    mBeanString = 'WebSphere:*,name=%s,type=Server,j2eeType=J2EEServer,node=%s' % (servername, nodename)
    serverMBean = AdminControl.queryNames(mBeanString)
    if (len(serverMBean) == 0):
        (state, pid) = ("UNREACHABLE", "-----")
    else:
        (state, pid) = (AdminControl.getAttribute(serverMBean,'state'), AdminControl.getAttribute(serverMBean,'pid'))

    print "%20s: %-30s => %15s : %s" % ( nodename, servername, state, pid)