---------------------------------------------
Puppet module for "Apache CloudStack 4.2.0" :
---------------------------------------------

CloudStack is an open source software platform that pools computing resources to build public, private, and hybrid Infrastructure as a Service(IaaS) clouds. CloudStack manages the network, storage, and compute nodes that make up a cloud infrastructure. Use CloudStack to deploy, manage, and configure cloud computing environments.

A CloudStack installation consists of two parts: the Management Server and the cloud infrastructure that it manages. When you set up and manage a CloudStack cloud, you provision resources such as hosts, storage devices, and IP addresses into the Management Server, and the Management Server manages those resources. The minimum production installation consists of one machine running the CloudStack Management Server and another machine to act as the cloud infrastructure (in this case, a very simple infrastructure consisting of one host running hypervisor software). In its smallest deployment, a single machine can act as both the Management Server and the hypervisor host (using the KVM hypervisor).

Management Server:
The Management Server is the CloudStack software that manages cloud resources. By interacting with the Management Server through its UI or API, you can configure and manage your cloud infrastructure. The Management Server runs on a dedicated server or VM. It controls allocation of virtual machines to hosts and assigns storage and IP addressesto the virtual machine instances. The Management Server runs in a Tomcat container and requires a MySQL database for persistence.

Cloud Infrastructure:
The Management Server manages one or more zones (typically, datacenters) containing host computers where guest virtual machines will run.
The cloud infrastructure is organized as follows:

- Zone: Typically, a zone is equivalent to a single datacenter. A zone consists of one or more pods and secondary storage.
- Pod: A pod is usually one rack of hardware that includes a layer-2 switch and one or more clusters.
- Cluster: A cluster consists of one or more hosts and primary storage.
- Host: A single compute node within a cluster. The hosts are where the actual cloud services run in the form of guest virtual machines.
- Primary storage is associated with a cluster, and it stores the disk volumes for all the VMs running on hosts in that cluster.
- Secondary storage is associated with a zone, and it stores templates, ISO images, and disk volume snapshots.

For more on cloudstack: http://cloudstack.apache.org/
