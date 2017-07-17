---
# haexample
HA with EAP example for openshift
---

1. oc cluster up --metrics
2. oc delete project haexample
3. oc new-project haexample
4. oc policy add-role-to-user view system:serviceaccount:haexample:default -n haexample

5. oc new-app --image-stream="openshift/jboss-eap70-openshift:latest" https://github.com/isnuryusuf/haexample#master --name='haexample' -l name='haexample' -e SELECTOR=haexample -e OPENSHIFT_KUBE_PING_NAMESPACE=haexample OPENSHIFT_KUBE_PING_LABELS=app=haexample 

6. oc env dc/haexample -e OPENSHIFT_KUBE_PING_NAMESPACE=haexample OPENSHIFT_KUBE_PING_LABELS=app=haexample


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

7. Scale to 2
8. oc expose service haexample --name haexample
9. oc get svc


![alt text](https://raw.githubusercontent.com/isnuryusuf/haexample/master/edb-redhat.png)
