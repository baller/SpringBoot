package com.example.demo.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.commom.Result;
import com.example.demo.entity.*;
import com.example.demo.entity.LendRecord;
import com.example.demo.entity.LendRecord;
import com.example.demo.mapper.BookMapper;
import com.example.demo.mapper.BookWithUserMapper;
import com.example.demo.mapper.LendRecordMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/LendRecord")
public class LendRecordController {
    @Resource
    LendRecordMapper LendRecordMapper;
    @Resource
    BookMapper BookMapper;
    @Resource
    BookWithUserMapper BookWithUserMapper;
    @PutMapping("/return/{isbn}")
    public Result<?> returnBook(@PathVariable String isbn, @RequestBody LendRecord lendRecord) {
        UpdateWrapper<LendRecord> updateWrapper = new UpdateWrapper<>();
        UpdateWrapper<Book> updateWrapperBook = new UpdateWrapper<>();
        UpdateWrapper<BookWithUser> updateWrapperBookWithUser = new UpdateWrapper<>();
        updateWrapperBook.eq("isbn", isbn);
        updateWrapperBookWithUser.eq("isbn", isbn);
        updateWrapper.eq("isbn", isbn);
        updateWrapper.eq("borrownum", lendRecord.getBorrownum());
        updateWrapper.isNull("return_time");
        LendRecord lendrecord = new LendRecord();
        Book book  = new Book();
        book.setStatus("1");
        lendrecord.setReturnTime(new Date()); // 设置归还时间为当前时间
        lendrecord.setStatus("1"); // 设置状态为已归还
        LendRecordMapper.update(lendrecord, updateWrapper);
        BookMapper.update(book,updateWrapperBook);
        BookWithUserMapper.delete(updateWrapperBookWithUser);
        return Result.success();
    }


    @DeleteMapping("/{isbn}")
    public Result<?> delete(@PathVariable String isbn){
        Map<String,Object> map = new HashMap<>();
        map.put("isbn",isbn);
        LendRecordMapper.deleteByMap(map);
        return Result.success();
    }
    //删除一条记录
    @PostMapping("/deleteRecord")
    public  Result<?> deleteRecord(@RequestBody LendRecord LendRecord){
        Map<String,Object> map = new HashMap<>();
        map.put("isbn",LendRecord.getIsbn());
        map.put("borrownum",LendRecord.getBorrownum());
        LendRecordMapper.deleteByMap(map);
        return Result.success();
    }
    @PostMapping("/deleteRecords")
    public Result<?> deleteRecords(@RequestBody List<LendRecord> LendRecords){
        int len = LendRecords.size();
        for(int i=0;i<len;i++) {
            LendRecord curRecord = LendRecords.get(i);
            Map<String,Object> map = new HashMap<>();
            map.put("isbn",curRecord.getIsbn());
            map.put("borrownum",curRecord.getBorrownum());
            LendRecordMapper.deleteByMap(map);
        }
        return Result.success();
    }
    @PostMapping
    public Result<?> save(@RequestBody LendRecord LendRecord){
        LendRecordMapper.insert(LendRecord);
        return Result.success();
    }
    @GetMapping
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "10") Integer pageSize,
                              @RequestParam(defaultValue = "") String search1,
                              @RequestParam(defaultValue = "") String search2,
                              @RequestParam(defaultValue = "") String search3){
        LambdaQueryWrapper<LendRecord> wrappers = Wrappers.<LendRecord>lambdaQuery();
        if(StringUtils.isNotBlank(search1)){
            wrappers.like(LendRecord::getIsbn,search1);
        }
        if(StringUtils.isNotBlank(search2)){
            wrappers.like(LendRecord::getBookname,search2);
        }
        if(StringUtils.isNotBlank(search3)){
            wrappers.like(LendRecord::getReaderId,search3);
        }
        Page<LendRecord> LendRecordPage =LendRecordMapper.selectPage(new Page<>(pageNum,pageSize), wrappers);
        return Result.success(LendRecordPage);
    }

    @PutMapping("/{isbn}")
    public  Result<?> update(@PathVariable String isbn,@RequestBody LendRecord lendRecord){
        UpdateWrapper<LendRecord> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("isbn",isbn);
        LendRecord lendrecord = new LendRecord();
        lendrecord.setLendTime(lendRecord.getLendTime());
        lendrecord.setReturnTime(lendRecord.getReturnTime());
        lendrecord.setStatus(lendRecord.getStatus());
        LendRecordMapper.update(lendrecord, updateWrapper);
        return Result.success();
    }
    @PutMapping("/{lendTime}")
    public  Result<?> update2(@PathVariable Date lendTime, @RequestBody LendRecord lendRecord){
        UpdateWrapper<LendRecord> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("lendTime",lendTime);
        LendRecord lendrecord = new LendRecord();
        lendrecord.setReturnTime(lendRecord.getReturnTime());
        lendrecord.setStatus(lendRecord.getStatus());
        LendRecordMapper.update(lendrecord, updateWrapper);
        return Result.success();
    }

}
