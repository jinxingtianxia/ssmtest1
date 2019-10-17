package com.controller;


import com.dto.Dog;
import com.dto.PersonInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.WritableByteChannel;

/**
 *
 * Date:2018/9/19
 * Time:14:20
 */
@Controller
public class Tc {

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST,value = "/postPersonInfoOneParam")
    public PersonInfo postPersonInfoOneParam(@RequestParam Long id )
    {
        PersonInfo personInfo=new PersonInfo();
        Dog dog=new Dog();
        dog.setSkill("天下");
        personInfo.setId(id);
        personInfo.setDog(dog);
        personInfo.setName("jin1");
        return personInfo;
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST,value = "/postPersonInfoTwoParam")
    public PersonInfo postPersonInfoTwoParam(@RequestParam Long id ,@RequestParam String name)
    {
        PersonInfo personInfo=new PersonInfo();
        Dog dog=new Dog();
        dog.setSkill("天下");
        personInfo.setId(id);
        personInfo.setDog(dog);
        personInfo.setName(name);
        return personInfo;
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET,value = "/getPersonInfoParam")
    public PersonInfo getPersonInfoParam(@RequestParam Long id )
    {
        PersonInfo personInfo=new PersonInfo();
        Dog dog=new Dog();
        dog.setSkill("天下");
        personInfo.setId(id);
        personInfo.setDog(dog);
        personInfo.setName("jinxing");
        return personInfo;
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET,value = "/getPersonInfoNoParam")
    public PersonInfo getPersonInfoNoParam()
    {
        PersonInfo personInfo=new PersonInfo();
        Dog dog=new Dog();
        dog.setSkill("天下");
        personInfo.setId(1000L);
        personInfo.setDog(dog);
        personInfo.setName("jinxing");
        return personInfo;
    }

    @RequestMapping("/fun1")
    public String fun1()
    {
        System.out.println("123");
        return "success";
    }

    @ResponseBody
    @RequestMapping("/fun2")
    public String fun2()
    {
        System.out.println("123");
        return "b";
    }

    /**
     * 实现文件的下载
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/down")
    public void down(HttpServletRequest request, HttpServletResponse response) throws Exception{

        String fileName = request.getSession().getServletContext().getRealPath("down")+"/baidu.apk";
        System.out.println(fileName);

        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));

        String filename = "baidu.apk";

        filename = URLEncoder.encode(filename,"UTF-8");

        response.addHeader("Content-Disposition", "attachment;filename=" + filename);

        response.setContentType("multipart/form-data");

        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();


    }
}
