<?php

echo '<strong style="color:green;">READ OK </strong><br />';
echo '<abbr>If you see this line, it means that you are able to read and execute PHP files from: '.__DIR__.'</abbr>';
echo '<br /><br />';

if (is_writable(__DIR__)){
    echo '<strong style="color:green;">WRITE OK </strong><br />';
    echo 'If you see this line, it means that you CAN write files in:'.__DIR__;
} else {
    echo '<strong style="color:red;">WRITE : ERROR </strong><br />';
    echo "If you see this line, it means that you CANNOT create files in:".__DIR__;
}

echo '<br /><br />';

if (is_executable(__DIR__.'/test.txt')){
    echo '<strong style="color:green;">EXECUTION OK </strong><br />';
    echo 'If you see this line, it means that you CAN execute files in:'.__DIR__;
} else {
    echo '<strong style="color:red;">EXECUTION : ERROR </strong><br />';
    echo "If you see this line, it means that you CANNOT execute files in:".__DIR__;
}