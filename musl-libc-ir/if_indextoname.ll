; ModuleID = 'src/network/if_indextoname.c'
source_filename = "src/network/if_indextoname.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ifreq = type { %union.anon, %union.anon.0 }
%union.anon = type { [16 x i8] }
%union.anon.0 = type { %struct.ifmap }
%struct.ifmap = type { i64, i64, i16, i8, i8, i8 }

; Function Attrs: nounwind optsize strictfp
define i8* @if_indextoname(i32 noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.ifreq, align 8
  %4 = getelementptr inbounds %struct.ifreq, %struct.ifreq* %3, i64 0, i32 0, i32 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %4) #4
  %5 = tail call i32 @socket(i32 noundef 1, i32 noundef 524290, i32 noundef 0) #5
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %21, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds %struct.ifreq, %struct.ifreq* %3, i64 0, i32 1
  %9 = bitcast %union.anon.0* %8 to i32*
  store i32 %0, i32* %9, align 8, !tbaa !3
  %10 = call i32 (i32, i32, ...) @ioctl(i32 noundef %5, i32 noundef 35088, %struct.ifreq* noundef nonnull %3) #5
  %11 = zext i32 %5 to i64
  %12 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %11) #4, !srcloc !6
  %13 = icmp slt i32 %10, 0
  br i1 %13, label %14, label %19

14:                                               ; preds = %7
  %15 = tail call i32* @___errno_location() #6
  %16 = load i32, i32* %15, align 4, !tbaa !7
  %17 = icmp eq i32 %16, 19
  br i1 %17, label %18, label %21

18:                                               ; preds = %14
  store i32 6, i32* %15, align 4, !tbaa !7
  br label %21

19:                                               ; preds = %7
  %20 = call i8* @strncpy(i8* noundef %1, i8* noundef nonnull %4, i64 noundef 16) #5
  br label %21

21:                                               ; preds = %14, %18, %2, %19
  %22 = phi i8* [ %20, %19 ], [ null, %2 ], [ null, %18 ], [ null, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %4) #4
  ret i8* %22
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ioctl(i32 noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @strncpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 121148}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !4, i64 0}
