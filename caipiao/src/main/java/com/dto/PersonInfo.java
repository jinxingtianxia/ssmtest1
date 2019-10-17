package com.dto;

/**
 * @author run.jin
 * @version 1.0
 * @name PersonInfo
 * @description
 * @date 2019/10/6
 */
public class PersonInfo {

    private Long id;
    private String name;
    private Dog dog;

    @Override
    public String toString() {
        return "PersonInfo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", dog=" + dog +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Dog getDog() {
        return dog;
    }

    public void setDog(Dog dog) {
        this.dog = dog;
    }
}
