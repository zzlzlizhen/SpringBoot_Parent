package com.zsm.websocket;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.stream.ChunkedWriteHandler;

/**
 * 初始化器，channel注册后，会执行相应的初始化方法
 */
public class WSServerInitialzer extends ChannelInitializer<SocketChannel> {
    @Override
    protected void initChannel(SocketChannel socketChannel) throws Exception {
        //通过socketChannel去获得对应的管道
        ChannelPipeline pipeline = socketChannel.pipeline();
        //websocket基于http协议，所以要有http解析器
        pipeline.addLast(new HttpServerCodec());
        //对写大数据流的支持
        pipeline.addLast(new ChunkedWriteHandler());
        //对httpMessage进行聚和，聚合成FullHttpRequest或FullHttpResponse
        //几乎在netty中的编程，都会使用此handller
        pipeline.addLast(new HttpObjectAggregator(1024*64));
        //==================以上用于支持http协议===============================
        /**
         * websocket服务器处理的协议，用于指定给客户端连接访问的路由：/ws
         * 本handleer会帮你处理一些繁重的复杂的事儿
         * 会帮你处理握手动作：handshaking（close，ping，pong） ping+pong = 心跳
         * 对于websocket来讲，都是以frames进行传输的，不同的数据类型对应的frames也不同
         */
        pipeline.addLast(new WebSocketServerProtocolHandler("/ws"));
        //自定义的hanler，对不同的数据进行处理
        pipeline.addLast(new MessageHandler());
    }
}
