package com.dao;

import com.entity.KehuEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.KehuView;

/**
 * 客户 Dao 接口
 *
 * @author 
 * @since 2021-03-13
 */
public interface KehuDao extends BaseMapper<KehuEntity> {

   List<KehuView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
