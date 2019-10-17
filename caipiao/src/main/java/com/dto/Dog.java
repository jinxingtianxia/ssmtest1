package com.dto;

/**
 * @author run.jin
 * @version 1.0
 * @name Dog
 * @description
 * @date 2019/10/6
 */
public class Dog {

    private String skill;

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    @Override
    public String toString() {
        return "Dog{" +
                "skill='" + skill + '\'' +
                '}';
    }
}
