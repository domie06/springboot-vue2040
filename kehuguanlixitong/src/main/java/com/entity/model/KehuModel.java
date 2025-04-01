package com.entity.model;

import com.entity.KehuEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 客户
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 * @author 
 * @email
 * @date 2021-03-13
 */
public class KehuModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 姓名
     */
    private String name;


    /**
     * 手机号
     */
    private String phone;


    /**
     * 邮箱
     */
    private String youxiang;


    /**
     * 身份证号
     */
    private String idNumber;


    /**
     * 性别
     */
    private Integer sexTypes;


    /**
     * 照片
     */
    private String myPhoto;


    /**
     * 民族
     */
    private String nation;


    /**
     * 政治面貌
     */
    private Integer politicsTypes;


    /**
     * 地址
     */
    private String birthplace;


    /**
     * 备注
     */
    private String kehuContent;


    /**
     * 地区
     */
    private Integer diquTypes;


    /**
     * 标签
     */
    private Integer biaoqianTypes;


    /**
     * 添加时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date insertTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date createTime;


    /**
	 * 获取：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 设置：主键
	 */
    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 获取：姓名
	 */
    public String getName() {
        return name;
    }


    /**
	 * 设置：姓名
	 */
    public void setName(String name) {
        this.name = name;
    }
    /**
	 * 获取：手机号
	 */
    public String getPhone() {
        return phone;
    }


    /**
	 * 设置：手机号
	 */
    public void setPhone(String phone) {
        this.phone = phone;
    }
    /**
	 * 获取：邮箱
	 */
    public String getYouxiang() {
        return youxiang;
    }


    /**
	 * 设置：邮箱
	 */
    public void setYouxiang(String youxiang) {
        this.youxiang = youxiang;
    }
    /**
	 * 获取：身份证号
	 */
    public String getIdNumber() {
        return idNumber;
    }


    /**
	 * 设置：身份证号
	 */
    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }
    /**
	 * 获取：性别
	 */
    public Integer getSexTypes() {
        return sexTypes;
    }


    /**
	 * 设置：性别
	 */
    public void setSexTypes(Integer sexTypes) {
        this.sexTypes = sexTypes;
    }
    /**
	 * 获取：照片
	 */
    public String getMyPhoto() {
        return myPhoto;
    }


    /**
	 * 设置：照片
	 */
    public void setMyPhoto(String myPhoto) {
        this.myPhoto = myPhoto;
    }
    /**
	 * 获取：民族
	 */
    public String getNation() {
        return nation;
    }


    /**
	 * 设置：民族
	 */
    public void setNation(String nation) {
        this.nation = nation;
    }
    /**
	 * 获取：政治面貌
	 */
    public Integer getPoliticsTypes() {
        return politicsTypes;
    }


    /**
	 * 设置：政治面貌
	 */
    public void setPoliticsTypes(Integer politicsTypes) {
        this.politicsTypes = politicsTypes;
    }
    /**
	 * 获取：地址
	 */
    public String getBirthplace() {
        return birthplace;
    }


    /**
	 * 设置：地址
	 */
    public void setBirthplace(String birthplace) {
        this.birthplace = birthplace;
    }
    /**
	 * 获取：备注
	 */
    public String getKehuContent() {
        return kehuContent;
    }


    /**
	 * 设置：备注
	 */
    public void setKehuContent(String kehuContent) {
        this.kehuContent = kehuContent;
    }
    /**
	 * 获取：地区
	 */
    public Integer getDiquTypes() {
        return diquTypes;
    }


    /**
	 * 设置：地区
	 */
    public void setDiquTypes(Integer diquTypes) {
        this.diquTypes = diquTypes;
    }
    /**
	 * 获取：标签
	 */
    public Integer getBiaoqianTypes() {
        return biaoqianTypes;
    }


    /**
	 * 设置：标签
	 */
    public void setBiaoqianTypes(Integer biaoqianTypes) {
        this.biaoqianTypes = biaoqianTypes;
    }
    /**
	 * 获取：添加时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 设置：添加时间
	 */
    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 获取：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
