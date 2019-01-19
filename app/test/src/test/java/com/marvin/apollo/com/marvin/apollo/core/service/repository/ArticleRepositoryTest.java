package com.marvin.apollo.com.marvin.apollo.core.service.repository;

import com.alibaba.fastjson.JSON;
import com.marvin.apollo.core.model.dto.ArticleDto;
import com.marvin.apollo.core.model.pagination.PageModel;
import com.marvin.apollo.core.service.repository.ArticleRepository;
import com.marvin.apollo.web.home.boot.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.assertTrue;

/**
 * @author hufeng
 * @version ArticleRepositoryTest.java, v 0.1 2019-01-13 22:20 Exp $
 */

public class ArticleRepositoryTest extends BaseTest {
    @Autowired
    private ArticleRepository articleRepository;

    @Test
    public void testPagingQuery() {
        PageModel<ArticleDto> pageModel = articleRepository.queryByPage(null, 1, 2);
        assertTrue(pageModel.getTotal() > 0);
        System.out.println(JSON.toJSONString(pageModel));
    }

}