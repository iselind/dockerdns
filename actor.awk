#!/usr/bin/awk -f

$3 == "start" {
    container_id = substr($4,1,12)

    cmd = "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "container_id
    cmd | getline address
    close(cmd)

    print "The Docker container",container_id,"started at",address
    print address,container_id,"# Docker" >> "/etc/hosts"
    close("/etc/hosts")
}
$3 == "die" {
    container_id = substr($4,1,12)
    print "The Docker container",container_id,"died"
    system("sed -i /"container_id"/d /etc/hosts")
}
