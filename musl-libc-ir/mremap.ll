; ModuleID = 'src/mman/mremap.c'
source_filename = "src/mman/mremap.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@__vm_wait = weak hidden alias void (), void ()* @dummy
@mremap = weak alias i8* (i8*, i64, i64, i32, ...), i8* (i8*, i64, i64, i32, ...)* @__mremap

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy() #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__mremap(i8* noundef %0, i64 noundef %1, i64 noundef %2, i32 noundef %3, ...) #1 {
  %5 = alloca [1 x %struct.__va_list_tag], align 16
  %6 = bitcast [1 x %struct.__va_list_tag]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %6) #6
  %7 = icmp ugt i64 %2, 9223372036854775806
  br i1 %7, label %8, label %10

8:                                                ; preds = %4
  %9 = tail call i32* @___errno_location() #7
  store i32 12, i32* %9, align 4, !tbaa !3
  br label %39

10:                                               ; preds = %4
  %11 = and i32 %3, 2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %32, label %13

13:                                               ; preds = %10
  tail call void @__vm_wait() #8
  call void @llvm.va_start(i8* nonnull %6) #9
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0, i32 0
  %15 = load i32, i32* %14, align 16
  %16 = icmp ult i32 %15, 41
  br i1 %16, label %17, label %23

17:                                               ; preds = %13
  %18 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0, i32 3
  %19 = load i8*, i8** %18, align 16
  %20 = zext i32 %15 to i64
  %21 = getelementptr i8, i8* %19, i64 %20
  %22 = add nuw nsw i32 %15, 8
  store i32 %22, i32* %14, align 16
  br label %27

23:                                               ; preds = %13
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0, i32 2
  %25 = load i8*, i8** %24, align 8
  %26 = getelementptr i8, i8* %25, i64 8
  store i8* %26, i8** %24, align 8
  br label %27

27:                                               ; preds = %23, %17
  %28 = phi i8* [ %21, %17 ], [ %25, %23 ]
  %29 = bitcast i8* %28 to i8**
  %30 = load i8*, i8** %29, align 8
  call void @llvm.va_end(i8* nonnull %6) #9
  %31 = ptrtoint i8* %30 to i64
  br label %32

32:                                               ; preds = %27, %10
  %33 = phi i64 [ %31, %27 ], [ 0, %10 ]
  %34 = ptrtoint i8* %0 to i64
  %35 = sext i32 %3 to i64
  %36 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 25, i64 %34, i64 %1, i64 %2, i64 %35, i64 %33) #6, !srcloc !7
  %37 = call i64 @__syscall_ret(i64 noundef %36) #8
  %38 = inttoptr i64 %37 to i8*
  br label %39

39:                                               ; preds = %32, %8
  %40 = phi i8* [ inttoptr (i64 -1 to i8*), %8 ], [ %38, %32 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %6) #6
  ret i8* %40
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #4

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #4

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #5

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nosync nounwind willreturn }
attributes #5 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #9 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 118493}
