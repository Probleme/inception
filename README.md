# What are containers ?
**Containers** are completely isolated environments. As in they can have  their own processes or services, their own network interfaces, their own mounts, just like washing machines, except they all share the same OS kernel.
It's also important to note that containers are not new with **Docker**.
**Containers** have existed for about 15 years now and some of the different types of containers are Aleksey LSD, like CFS, etc.
**Docker** utilizes Aleksey containers. Setting up these container environments is hard as they are very low-level and that is where docker offers a high-level two, with serveral powerful functionnalities making it really easy for end users like us.

# Understanding how docker work ?
to uderstand how docker works lets us revisit some basic concepts of operating system first. 
if you look at operating system like : Ubuntu, Fedora, Susi or Centos, they all consist of two things, an OS kernel and a set of software. the OS kernel is responsible for interacting with the underlying hardware, while the OS kernel remains the same, which is Linux in this case, it's the software above it that makes these operating systems different. This software may consist of a different user interface drivers,compilers, file managers, developer tools, etc. So you have a common Linux kernel shared across all OSS and some custom software that differentiate operating systems from each other.

## We said earlier that docker containers share  the underlying kernel. So what does actually mean, Sharing the kernel ?
Let's say we have a system with an **Ubuntu** OS with **Docker** installed on it.
**Docker** can run any flavor of OS on top of it, as long as they're all based on the same kernel. In this case **Linux**. If the underlying OS is **Ubuntu**, **Docker** can run a container based on another distribution like Debian, Fedora, Susi or Centos each docker container only has the additional software that we just talked about in the previous slide that makes these operating systems different. And **Docker** utilizes the underlying kernel of the Docker Host, wich works with all OSS above.

# What is an OS does not share the same kernel?
The OS that not share the kernel is **Windows**. And so we won't be able to run a **Windows** based Container on a Docker Host with linux on it. For that we will require docker on a Windows Server.
When we install **Docker** on **Windows** and run a Linux container on Windows, we not really running a linux container on windows, **Windows** runs a linux container on a linux virtual machine under the hoods. So it's really a Linux container on on linux virtual machine on windows.

# Isn't that a disadvantage then not being able to run another kernel on the OS ?
the answer is **No**. Because unlike hypervisors, Docker is not meant to virtualize and run different operating systems and kernels on the same hardware. The main purpose of Docker is to package and containerize applications and to ship them and to run them anywhere anytime, as many as we want. 