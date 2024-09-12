GO_VERSION := 1.23.1

.PHONY: install-go init-go

setup: install-go init-go

install-go:
	wget "https://golang.google.cn/dl/go$(GO_VERSION).linux-amd64.tar.gz"
	sudo tar -C /usr/local -xzf go$(GO_VERSION).linux.amd64.tar.gz
	rm go$(GO_VERSION).linux.amd64.tar.gz

init-go:
	echo 'export PATH=$$PATH:/usr/local/go/bin' >> $${HOME}/.zshrc
	echo 'export PATH=$$PATH:$${HOME}/go/bin' >> $${HOME}/.zshrc

build:
	go build -o api cmd/main.go

test:
	go test ./... -coverprofile=coverage.out

coverage:
	go tool cover -func coverage.out | grep "total:" | \
	awk '{print ((int($$3)0) != 1)}'

report:
	go tool cover -html=coverage.out -o cover.html
