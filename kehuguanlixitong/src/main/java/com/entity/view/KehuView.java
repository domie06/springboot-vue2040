package com.entity.view;

import com.entity.KehuEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;

/**
 * 客户
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email
 * @date 2021-03-13
 */
@TableName("kehu")
public class KehuView extends KehuEntity implements Serializable {
    private static final long serialVersionUID = 1L;
		/**
		* 性别的值
		*/
		private String sexValue;
		/**
		* 政治面貌的值
		*/
		private String politicsValue;
		/**
		* 地区的值
		*/
		private String diquValue;
		/**
		* 标签的值
		*/
		private String biaoqianValue;



	public KehuView() {

	}

	public KehuView(KehuEntity kehuEntity) {
		try {
			BeanUtils.copyProperties(this, kehuEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 性别的值
			*/
			public String getSexValue() {
				return sexValue;
			}
			/**
			* 设置： 性别的值
			*/
			public void setSexValue(String sexValue) {
				this.sexValue = sexValue;
			}
			/**
			* 获取： 政治面貌的值
			*/
			public String getPoliticsValue() {
				return politicsValue;
			}
			/**
			* 设置： 政治面貌的值
			*/
			public void setPoliticsValue(String politicsValue) {
				this.politicsValue = politicsValue;
			}
			/**
			* 获取： 地区的值
			*/
			public String getDiquValue() {
				return diquValue;
			}
			/**
			* 设置： 地区的值
			*/
			public void setDiquValue(String diquValue) {
				this.diquValue = diquValue;
			}
			/**
			* 获取： 标签的值
			*/
			public String getBiaoqianValue() {
				return biaoqianValue;
			}
			/**
			* 设置： 标签的值
			*/
			public void setBiaoqianValue(String biaoqianValue) {
				this.biaoqianValue = biaoqianValue;
			}








}
