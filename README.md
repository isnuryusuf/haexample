---
# haexample
HA with EAP example for openshift
---

oc cluster up --metrics
oc delete project haexample
oc new-project haexample
oc policy add-role-to-user view system:serviceaccount:haexample:default -n haexample

oc new-app --image-stream="openshift/jboss-eap70-openshift:latest" https://github.com/isnuryusuf/haexample#master --name='haexample' -l name='haexample' -e SELECTOR=haexample -e OPENSHIFT_KUBE_PING_NAMESPACE=haexample OPENSHIFT_KUBE_PING_LABELS=app=haexample 

oc env dc/haexample -e OPENSHIFT_KUBE_PING_NAMESPACE=haexample OPENSHIFT_KUBE_PING_LABELS=app=haexample


`
16:53:27,629 FINE  [org.openshift.ping.kube.Client] (thread-3,ee,haexample-1-rt1xj) getPods(haexample, app=haexample) = [Pod[podIP=172.17.0.18, containers=[Container[ports=[]]]]]
`


`
          ports:
            - containerPort: 8080
              protocol: TCP
            - containerPort: 8443
              protocol: TCP
            - containerPort: 8778
              protocol: TCP
            - name: ping
              containerPort: 8888
              protocol: TCP
`

Scale to 2
oc expose service haexample --name haexample
oc get svc


![alt text](https://raw.githubusercontent.com/isnuryusuf/haexample/master/edb-redhat.png)
