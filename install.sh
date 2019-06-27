#!/bin/sh

apt install figlet -y
chmod -x /etc/update-motd.d/*

cat > /etc/update-motd.d/assurity <<'EOF'
#!/bin/sh
figlet Hello Assurity DevOps
EOF

chmod a+x /etc/update-motd.d/assurity