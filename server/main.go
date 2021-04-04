package main

import (
	"context"
	pb "flutter-grpc-go/protobuf/chat"
	"fmt"
	"log"
	"net"

	grpc "google.golang.org/grpc"
)

type MessageServerService struct {
	pb.UnimplementedMessageServiceServer
}

func (server *MessageServerService) OnSend(context context.Context, r *pb.RequestMessage) (*pb.ResponseMessage, error) {
	log.Printf("Received: %v", r.GetName())
	log.Printf("Received: %v", r.GetMessage())
	return &pb.ResponseMessage{Message: r.GetMessage(), Name: r.GetName()}, nil
}

func main() {
	lis, err := net.Listen("tcp", ":3000")
	//
	if err != nil {
		log.Fatalln(err.Error())
	}

	//grpc server
	server := grpc.NewServer()
	pb.RegisterMessageServiceServer(server, &MessageServerService{})
	if err := server.Serve(lis); err != nil {
		log.Fatalln("starting Server error :", err.Error())
	}
	fmt.Print("starting")
}
