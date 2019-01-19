package com.marvin.apollo.core.service.repository.convert;

import com.marvin.apollo.common.dal.entity.ArticleEntity;
import com.marvin.apollo.core.model.dto.ArticleDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

import java.nio.charset.Charset;
import java.util.List;

/**
 * @author hufeng
 * @version ArticleConvert.java, v 0.1 2019-01-13 21:11 Exp $
 */
@Mapper
public interface ArticleConvert extends DefaultConvert {
    ArticleConvert INSTANCE = Mappers.getMapper(ArticleConvert.class);

    @Mappings({
            @Mapping(source = "invisible", target = "invisibleStatus"),
            @Mapping(source = "top", target = "top"),
            @Mapping(source = "gmtCreate", target = "createTime"),
            @Mapping(source = "gmtModified", target = "modifiedTime"),
            @Mapping(source = "categoryEntity.id", target = "categoryId"),
            @Mapping(source = "categoryEntity.name", target = "categoryName"),
    })
    ArticleDto entityToDto(ArticleEntity entity);

    List<ArticleDto> entitiesToDtos(List<ArticleEntity> entities);

    default String bytesToString(byte[] data) {
        if (data == null || data.length == 0) {
            return null;
        }
        return new String(data, Charset.forName("UTF-8"));
    }
}