; ModuleID = 'src/network/if_nametoindex.c'
source_filename = "src/network/if_nametoindex.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ifreq = type { %union.anon, %union.anon.0 }
%union.anon = type { [16 x i8] }
%union.anon.0 = type { %struct.ifmap }
%struct.ifmap = type { i64, i64, i16, i8, i8, i8 }

; Function Attrs: nounwind optsize strictfp
define i32 @if_nametoindex(i8* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.ifreq, align 8
  %3 = getelementptr inbounds %struct.ifreq, %struct.ifreq* %2, i64 0, i32 0, i32 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %3) #3
  %4 = tail call i32 @socket(i32 noundef 1, i32 noundef 524290, i32 noundef 0) #4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %16, label %6

6:                                                ; preds = %1
  %7 = call i8* @strncpy(i8* noundef nonnull %3, i8* noundef %0, i64 noundef 16) #4
  %8 = call i32 (i32, i32, ...) @ioctl(i32 noundef %4, i32 noundef 35123, %struct.ifreq* noundef nonnull %2) #4
  %9 = zext i32 %4 to i64
  %10 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %9) #3, !srcloc !3
  %11 = icmp slt i32 %8, 0
  %12 = getelementptr inbounds %struct.ifreq, %struct.ifreq* %2, i64 0, i32 1
  %13 = bitcast %union.anon.0* %12 to i32*
  %14 = load i32, i32* %13, align 8
  %15 = select i1 %11, i32 0, i32 %14
  br label %16

16:                                               ; preds = %1, %6
  %17 = phi i32 [ %15, %6 ], [ 0, %1 ]
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %3) #3
  ret i32 %17
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strncpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ioctl(i32 noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 121068}
