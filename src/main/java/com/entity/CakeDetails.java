package com.entity;

public class CakeDetails {
   private int cakeId;
   private String cakename;
   private String flavour;
   private String price;
   private String status;
   private String photo;
   private String email;

   public CakeDetails() {
   }

   public CakeDetails(String cakename, String flavour, String price, String status, String photo, String email) {
      this.cakename = cakename;
      this.flavour = flavour;
      this.price = price;
      this.status = status;
      this.photo = photo;
      this.email = email;
   }

   public int getCakeId() {
      return this.cakeId;
   }

   public void setCakeId(int cakeId) {
      this.cakeId = cakeId;
   }

   public String getCakename() {
      return this.cakename;
   }

   public void setCakename(String cakename) {
      this.cakename = cakename;
   }

   public String getFlavour() {
      return this.flavour;
   }

   public void setFlavour(String flavour) {
      this.flavour = flavour;
   }

   public String getPrice() {
      return this.price;
   }

   public void setPrice(String price) {
      this.price = price;
   }

   public String getStatus() {
      return this.status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public String getPhoto() {
      return this.photo;
   }

   public void setPhoto(String photo) {
      this.photo = photo;
   }

   public String getEmail() {
      return this.email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String toString() {
      return "CakeDetails [cakeId=" + this.cakeId + ", cakename=" + this.cakename + ", flavour=" + this.flavour + ", price=" + this.price + ", status=" + this.status + ", photo=" + this.photo + ", email=" + this.email + "]";
   }
}