package com.zsm;

import com.zsm.websocket.WSServerInitialzer;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;

public class TestWebSocket {
  public static void main(String[] args) throws Exception{
      //定义一对线程组
      //主线程组，用于接受客户端的链接，但是不做任何处理，跟老板一样，不做事
      EventLoopGroup bossGroup = new NioEventLoopGroup();
      //从线程，老板线程组会把任务丢给他，让手下线程组去做任务
      EventLoopGroup workerGroup = new NioEventLoopGroup();
      try {
          //netty服务器的创建，serverBootstrap是一个启动类
          ServerBootstrap serverBootstrap = new ServerBootstrap();
          serverBootstrap.group(bossGroup,workerGroup)//设置主从线程组
                  .channel(NioServerSocketChannel.class)//设置nio的双向通道
                  .childHandler(new WSServerInitialzer());//子处理器，用于处理workerGroup
          //启动server，并且设置8021为启动的端口号，同时启动方式为同步
          ChannelFuture channelFuture = serverBootstrap.bind(8021).sync();
          //监听关闭的channel，设置同步方式
          channelFuture.channel().closeFuture().sync();
      }finally {
          bossGroup.shutdownGracefully();
          workerGroup.shutdownGracefully();
      }
   }
}
