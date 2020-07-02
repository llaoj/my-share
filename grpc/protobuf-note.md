## Message Type

### field number
- 1. 1-15 占 1byte 存field number & field's type
- 2. 16-2047 占 2bytes
- 3. smallest: 1
- 4. largest: 2^29-1
- 5. 不能用 reserved field numbers
- x. 19000-19999为系统保留, 不能用

### field rules
- 6. 一旦指定required 就不要改了
- 7. 为了防止依赖膨胀, 尽量不要在一个proto文件中定义大量有依赖关系的message
- 8. 不要删除或者注释field, 用reserved

### field type
- 9. enum 使用varint encoding 赋值效率不高不建议使用
- 10. groups 已经废弃, 不要使用, 请用nested类型(message 嵌套)

### Update Message Type
- 11. 不要修改 field number
- 12. 新增字段类型要为 optional 或 repeated
- 13. 给新增字段一个默认值
- 14. 新增字段后, 旧代码会正常工作, 序列化也会出现新字段
- 15. 非 required 字段可以被删除, 但是 field number 不能再用, 字段加OBSOLETE_前缀,或 把该field number 加入到 reserved 中
- 16. 同类型的 field type之间是互相兼容的 可以 更换, 具体看文档
- 17. 默认值可以修改, 不会随网络发送, 生成的程序时写在代码内部的.

### Extensions
- 18. 为了避免混淆, 不建议使用 nested extension

### Oneof
- 19. field 前不能使用required, optional, repeated 关键词
- 20. 只有最新设置的field才会生效
- 21. extension 中不能用

### Maps
- 22. 元素顺序不能保证
- 23. 可以使用如下语法替代
```
message MapFieldEntry {
  optional key_type key = 1;
  optional value_type value = 2;
}

repeated MapFieldEntry map_field = N;
```

- 24. ...
