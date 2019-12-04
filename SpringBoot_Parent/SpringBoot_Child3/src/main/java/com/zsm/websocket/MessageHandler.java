package com.zsm.websocket;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.util.concurrent.GlobalEventExecutor;

import java.time.LocalDateTime;

/**
 * 处理消息的handler
 * TextWebSocketFrame： 在netty中，是用于为websocket专门处理文本的对象，frame是消息载体
 */
public class MessageHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {
    //用于记录和管理所有的客户端channel
    private static ChannelGroup clients = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
    @Override
    protected void channelRead0(ChannelHandlerContext ctx, TextWebSocketFrame msg) throws Exception {
       //获取客户端传输过来的消息
        String content = msg.text();
        System.out.println("接受到的数据：" + content);
        for(Channel channel:clients){
            channel.writeAndFlush(new TextWebSocketFrame("[服务器接受到消息：]" + LocalDateTime.now() + "接受到的消息为：" + content));
        }
//        clients.writeAndFlush(new TextWebSocketFrame("[服务器接受到消息：]" + LocalDateTime.now() + "接受到的消息为：" + content));
    }

    /**
     * 当客户端连接服务器端之后（打开连接）
     * 获取客户端的channel，并且到ChannelGroup中去进行管理
     * @param ctx
     * @throws Exception
     */
    @Override
    public void handlerAdded(ChannelHandlerContext ctx) throws Exception {
        clients.add(ctx.channel()) ;
    }

    @Override
    public void handlerRemoved(ChannelHandlerContext ctx) throws Exception {
        //当触发handlerRemove，channerGoup会自动移除对应客户端的channel
        System.out.println("客户断开，channele对应的长id为："+ctx.channel().id().asLongText());
        System.out.println("客户断开，channele对应的短id为："+ctx.channel().id().asShortText());
//        clients.remove(ctx.channel());
    }
}
