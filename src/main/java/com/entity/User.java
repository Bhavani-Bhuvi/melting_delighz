package com.entity;

public class User {
   private int id;
   private String name;
   private String email;
   private String password;
   private String phone_no;
   private String address;
   private String landmark;
   private String city;
   private String state;
   private String pincode;

   public int getId() {
      return this.id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getName() {
      return this.name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getEmail() {
      return this.email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPassword() {
      return this.password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getPhone_no() {
      return this.phone_no;
   }

   public void setPhone_no(String phone_no) {
      this.phone_no = phone_no;
   }

   public String getAddress() {
      return this.address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getLandmark() {
      return this.landmark;
   }

   public void setLandmark(String landmark) {
      this.landmark = landmark;
   }

   public String getCity() {
      return this.city;
   }

   public void setCity(String city) {
      this.city = city;
   }

   public String getState() {
      return this.state;
   }

   public void setState(String state) {
      this.state = state;
   }

   public String getPincode() {
      return this.pincode;
   }

   public void setPincode(String pincode) {
      this.pincode = pincode;
   }

   public String toString() {
      return "User [id=" + this.id + ", name=" + this.name + ", email=" + this.email + ", password=" + this.password + ", phone_no=" + this.phone_no + ", address=" + this.address + ", landmark=" + this.landmark + ", city=" + this.city + ", state=" + this.state + ", pincode=" + this.pincode + "]";
   }
}