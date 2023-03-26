; ModuleID = 'src/stdio/tmpfile.c'
source_filename = "src/stdio/tmpfile.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@__const.tmpfile.s = private unnamed_addr constant [20 x i8] c"/tmp/tmpfile_XXXXXX\00", align 16
@.str = private unnamed_addr constant [3 x i8] c"w+\00", align 1

@tmpfile64 = weak alias %struct._IO_FILE* (), %struct._IO_FILE* ()* @tmpfile

; Function Attrs: nounwind optsize strictfp
define %struct._IO_FILE* @tmpfile() #0 {
  %1 = alloca [20 x i8], align 16
  %2 = getelementptr inbounds [20 x i8], [20 x i8]* %1, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %2) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(20) %2, i8* noundef nonnull align 16 dereferenceable(20) getelementptr inbounds ([20 x i8], [20 x i8]* @__const.tmpfile.s, i64 0, i64 0), i64 20, i1 false) #5
  %3 = getelementptr inbounds [20 x i8], [20 x i8]* %1, i64 0, i64 13
  %4 = ptrtoint [20 x i8]* %1 to i64
  br label %8

5:                                                ; preds = %8
  %6 = add nuw nsw i32 %9, 1
  %7 = icmp eq i32 %6, 100
  br i1 %7, label %24, label %8

8:                                                ; preds = %0, %5
  %9 = phi i32 [ 0, %0 ], [ %6, %5 ]
  %10 = call i8* @__randname(i8* noundef nonnull %3) #6
  %11 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 2, i64 %4, i64 32962, i64 384) #4, !srcloc !3
  %12 = call i64 @__syscall_ret(i64 noundef %11) #6
  %13 = and i64 %12, 2147483648
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %5

15:                                               ; preds = %8
  %16 = trunc i64 %12 to i32
  %17 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 87, i64 %4) #4, !srcloc !4
  %18 = call %struct._IO_FILE* @__fdopen(i32 noundef %16, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)) #6
  %19 = icmp eq %struct._IO_FILE* %18, null
  br i1 %19, label %20, label %24

20:                                               ; preds = %15
  %21 = shl i64 %12, 32
  %22 = ashr exact i64 %21, 32
  %23 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %22) #4, !srcloc !4
  br label %24

24:                                               ; preds = %5, %15, %20
  %25 = phi %struct._IO_FILE* [ null, %20 ], [ %18, %15 ], [ null, %5 ]
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %2) #4
  ret %struct._IO_FILE* %25
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: optsize
declare hidden i8* @__randname(i8* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__fdopen(i32 noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 105927}
!4 = !{i64 105529}
