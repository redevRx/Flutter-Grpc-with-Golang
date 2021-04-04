module chat

go 1.16

replace flutter-grpc-go/protobuf/chat => ../protobuf

require (
    flutter-grpc-go/protobuf/chat v1.2.3
	github.com/golang/protobuf v1.5.2 // indirect
	golang.org/x/net v0.0.0-20210331212208-0fccb6fa2b5c // indirect
	golang.org/x/sys v0.0.0-20210403161142-5e06dd20ab57 // indirect
	golang.org/x/text v0.3.6 // indirect
	google.golang.org/genproto v0.0.0-20210402141018-6c239bbf2bb1 // indirect
	google.golang.org/grpc v1.36.1 // indirect
)
