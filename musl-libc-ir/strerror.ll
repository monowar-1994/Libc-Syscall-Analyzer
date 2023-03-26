; ModuleID = 'src/errno/strerror.c'
source_filename = "src/errno/strerror.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.errmsgstr_t = type { [21 x i8], [22 x i8], [13 x i8], [25 x i8], [10 x i8], [18 x i8], [24 x i8], [26 x i8], [16 x i8], [12 x i8], [30 x i8], [24 x i8], [14 x i8], [14 x i8], [24 x i8], [33 x i8], [13 x i8], [18 x i8], [22 x i8], [20 x i8], [25 x i8], [20 x i8], [19 x i8], [13 x i8], [20 x i8], [15 x i8], [12 x i8], [10 x i8], [26 x i8], [22 x i8], [15 x i8], [16 x i8], [15 x i8], [15 x i8], [18 x i8], [17 x i8], [23 x i8], [19 x i8], [18 x i8], [30 x i8], [30 x i8], [20 x i8], [17 x i8], [12 x i8], [15 x i8], [15 x i8], [19 x i8], [30 x i8], [22 x i8], [20 x i8], [19 x i8], [25 x i8], [27 x i8], [19 x i8], [20 x i8], [18 x i8], [15 x i8], [25 x i8], [22 x i8], [15 x i8], [12 x i8], [29 x i8], [13 x i8], [29 x i8], [18 x i8], [31 x i8], [23 x i8], [23 x i8], [26 x i8], [14 x i8], [30 x i8], [41 x i8], [22 x i8], [16 x i8], [20 x i8], [28 x i8], [19 x i8], [26 x i8], [20 x i8], [21 x i8], [34 x i8], [30 x i8], [22 x i8], [18 x i8], [17 x i8], [15 x i8], [16 x i8], [18 x i8], [19 x i8], [27 x i8], [16 x i8], [21 x i8], [28 x i8] }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@errmsgstr = internal constant %struct.errmsgstr_t { [21 x i8] c"No error information\00", [22 x i8] c"Illegal byte sequence\00", [13 x i8] c"Domain error\00", [25 x i8] c"Result not representable\00", [10 x i8] c"Not a tty\00", [18 x i8] c"Permission denied\00", [24 x i8] c"Operation not permitted\00", [26 x i8] c"No such file or directory\00", [16 x i8] c"No such process\00", [12 x i8] c"File exists\00", [30 x i8] c"Value too large for data type\00", [24 x i8] c"No space left on device\00", [14 x i8] c"Out of memory\00", [14 x i8] c"Resource busy\00", [24 x i8] c"Interrupted system call\00", [33 x i8] c"Resource temporarily unavailable\00", [13 x i8] c"Invalid seek\00", [18 x i8] c"Cross-device link\00", [22 x i8] c"Read-only file system\00", [20 x i8] c"Directory not empty\00", [25 x i8] c"Connection reset by peer\00", [20 x i8] c"Operation timed out\00", [19 x i8] c"Connection refused\00", [13 x i8] c"Host is down\00", [20 x i8] c"Host is unreachable\00", [15 x i8] c"Address in use\00", [12 x i8] c"Broken pipe\00", [10 x i8] c"I/O error\00", [26 x i8] c"No such device or address\00", [22 x i8] c"Block device required\00", [15 x i8] c"No such device\00", [16 x i8] c"Not a directory\00", [15 x i8] c"Is a directory\00", [15 x i8] c"Text file busy\00", [18 x i8] c"Exec format error\00", [17 x i8] c"Invalid argument\00", [23 x i8] c"Argument list too long\00", [19 x i8] c"Symbolic link loop\00", [18 x i8] c"Filename too long\00", [30 x i8] c"Too many open files in system\00", [30 x i8] c"No file descriptors available\00", [20 x i8] c"Bad file descriptor\00", [17 x i8] c"No child process\00", [12 x i8] c"Bad address\00", [15 x i8] c"File too large\00", [15 x i8] c"Too many links\00", [19 x i8] c"No locks available\00", [30 x i8] c"Resource deadlock would occur\00", [22 x i8] c"State not recoverable\00", [20 x i8] c"Previous owner died\00", [19 x i8] c"Operation canceled\00", [25 x i8] c"Function not implemented\00", [27 x i8] c"No message of desired type\00", [19 x i8] c"Identifier removed\00", [20 x i8] c"Device not a stream\00", [18 x i8] c"No data available\00", [15 x i8] c"Device timeout\00", [25 x i8] c"Out of streams resources\00", [22 x i8] c"Link has been severed\00", [15 x i8] c"Protocol error\00", [12 x i8] c"Bad message\00", [29 x i8] c"File descriptor in bad state\00", [13 x i8] c"Not a socket\00", [29 x i8] c"Destination address required\00", [18 x i8] c"Message too large\00", [31 x i8] c"Protocol wrong type for socket\00", [23 x i8] c"Protocol not available\00", [23 x i8] c"Protocol not supported\00", [26 x i8] c"Socket type not supported\00", [14 x i8] c"Not supported\00", [30 x i8] c"Protocol family not supported\00", [41 x i8] c"Address family not supported by protocol\00", [22 x i8] c"Address not available\00", [16 x i8] c"Network is down\00", [20 x i8] c"Network unreachable\00", [28 x i8] c"Connection reset by network\00", [19 x i8] c"Connection aborted\00", [26 x i8] c"No buffer space available\00", [20 x i8] c"Socket is connected\00", [21 x i8] c"Socket not connected\00", [34 x i8] c"Cannot send after socket shutdown\00", [30 x i8] c"Operation already in progress\00", [22 x i8] c"Operation in progress\00", [18 x i8] c"Stale file handle\00", [17 x i8] c"Remote I/O error\00", [15 x i8] c"Quota exceeded\00", [16 x i8] c"No medium found\00", [18 x i8] c"Wrong medium type\00", [19 x i8] c"Multihop attempted\00", [27 x i8] c"Required key not available\00", [16 x i8] c"Key has expired\00", [21 x i8] c"Key has been revoked\00", [28 x i8] c"Key was rejected by service\00" }, align 1
@errmsgidx = internal unnamed_addr constant [132 x i16] [i16 0, i16 109, i16 133, i16 159, i16 269, i16 523, i16 533, i16 677, i16 642, i16 797, i16 817, i16 293, i16 241, i16 91, i16 834, i16 559, i16 255, i16 175, i16 339, i16 581, i16 596, i16 612, i16 660, i16 737, i16 767, i16 81, i16 627, i16 846, i16 217, i16 326, i16 357, i16 861, i16 511, i16 43, i16 56, i16 895, i16 719, i16 876, i16 986, i16 379, i16 700, i16 0, i16 1011, i16 1038, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 1057, i16 1077, i16 1095, i16 1110, i16 0, i16 0, i16 0, i16 1135, i16 0, i16 0, i16 0, i16 1157, i16 1803, i16 0, i16 1172, i16 187, i16 0, i16 1184, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 21, i16 0, i16 0, i16 0, i16 1213, i16 1226, i16 1255, i16 1273, i16 1304, i16 1327, i16 1350, i16 1376, i16 1390, i16 1420, i16 496, i16 1461, i16 1483, i16 1499, i16 1519, i16 1547, i16 399, i16 1566, i16 1592, i16 1612, i16 1633, i16 0, i16 424, i16 444, i16 463, i16 476, i16 1667, i16 1697, i16 1719, i16 0, i16 0, i16 0, i16 0, i16 1737, i16 1754, i16 1769, i16 1785, i16 967, i16 1822, i16 1849, i16 1865, i16 1886, i16 947, i16 925], align 16

@strerror_l = weak alias i8* (i32, %struct.__locale_struct*), i8* (i32, %struct.__locale_struct*)* @__strerror_l

; Function Attrs: nounwind optsize strictfp
define i8* @__strerror_l(i32 noundef %0, %struct.__locale_struct* nocapture noundef readonly %1) #0 {
  %3 = icmp ugt i32 %0, 131
  %4 = select i1 %3, i32 0, i32 %0
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds [132 x i16], [132 x i16]* @errmsgidx, i64 0, i64 %5
  %7 = load i16, i16* %6, align 2, !tbaa !3
  %8 = zext i16 %7 to i64
  %9 = getelementptr inbounds %struct.errmsgstr_t, %struct.errmsgstr_t* @errmsgstr, i64 0, i32 0, i64 %8
  %10 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %1, i64 0, i32 0, i64 5
  %11 = load %struct.__locale_map*, %struct.__locale_map** %10, align 8, !tbaa !7
  %12 = tail call i8* @__lctrans(i8* noundef nonnull %9, %struct.__locale_map* noundef %11) #2
  ret i8* %12
}

; Function Attrs: optsize
declare hidden i8* @__lctrans(i8* noundef, %struct.__locale_map* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i8* @strerror(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !9
  %3 = inttoptr i64 %2 to %struct.__pthread*
  %4 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %3, i64 0, i32 24
  %5 = load %struct.__locale_struct*, %struct.__locale_struct** %4, align 8, !tbaa !10
  %6 = icmp ugt i32 %0, 131
  %7 = select i1 %6, i32 0, i32 %0
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds [132 x i16], [132 x i16]* @errmsgidx, i64 0, i64 %8
  %10 = load i16, i16* %9, align 2, !tbaa !3
  %11 = zext i16 %10 to i64
  %12 = getelementptr inbounds %struct.errmsgstr_t, %struct.errmsgstr_t* @errmsgstr, i64 0, i32 0, i64 %11
  %13 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %5, i64 0, i32 0, i64 5
  %14 = load %struct.__locale_map*, %struct.__locale_map** %13, align 8, !tbaa !7
  %15 = tail call i8* @__lctrans(i8* noundef nonnull %12, %struct.__locale_map* noundef %14) #2
  ret i8* %15
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"short", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{i64 276648}
!10 = !{!11, !8, i64 168}
!11 = !{!"__pthread", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !12, i64 32, !12, i64 40, !13, i64 48, !13, i64 52, !13, i64 56, !13, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !8, i64 72, !12, i64 80, !8, i64 88, !12, i64 96, !12, i64 104, !8, i64 112, !8, i64 120, !8, i64 128, !14, i64 136, !13, i64 160, !13, i64 164, !8, i64 168, !5, i64 176, !8, i64 184, !8, i64 192}
!12 = !{!"long", !5, i64 0}
!13 = !{!"int", !5, i64 0}
!14 = !{!"", !8, i64 0, !12, i64 8, !8, i64 16}
