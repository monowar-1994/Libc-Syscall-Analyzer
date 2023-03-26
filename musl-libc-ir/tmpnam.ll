; ModuleID = 'src/stdio/tmpnam.c'
source_filename = "src/stdio/tmpnam.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.kstat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [3 x i64] }

@tmpnam.internal = internal global [20 x i8] zeroinitializer, align 16
@__const.tmpnam.s = private unnamed_addr constant [19 x i8] c"/tmp/tmpnam_XXXXXX\00", align 16

; Function Attrs: nounwind optsize strictfp
define i8* @tmpnam(i8* noundef %0) local_unnamed_addr #0 {
  %2 = alloca [19 x i8], align 16
  %3 = alloca %struct.kstat, align 8
  %4 = getelementptr inbounds [19 x i8], [19 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 19, i8* nonnull %4) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(19) %4, i8* noundef nonnull align 16 dereferenceable(19) getelementptr inbounds ([19 x i8], [19 x i8]* @__const.tmpnam.s, i64 0, i64 0), i64 19, i1 false) #6
  %5 = getelementptr inbounds [19 x i8], [19 x i8]* %2, i64 0, i64 12
  %6 = ptrtoint [19 x i8]* %2 to i64
  %7 = bitcast %struct.kstat* %3 to i8*
  %8 = ptrtoint %struct.kstat* %3 to i64
  br label %12

9:                                                ; preds = %12
  %10 = add nuw nsw i32 %13, 1
  %11 = icmp eq i32 %10, 100
  br i1 %11, label %22, label %12

12:                                               ; preds = %1, %9
  %13 = phi i32 [ 0, %1 ], [ %10, %9 ]
  %14 = call i8* @__randname(i8* noundef nonnull %5) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(144) %7, i8 0, i64 144, i1 false) #6
  %15 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 6, i64 %6, i64 %8) #5, !srcloc !3
  %16 = trunc i64 %15 to i32
  %17 = icmp eq i32 %16, -2
  br i1 %17, label %18, label %9

18:                                               ; preds = %12
  %19 = icmp eq i8* %0, null
  %20 = select i1 %19, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @tmpnam.internal, i64 0, i64 0), i8* %0
  %21 = call i8* @strcpy(i8* noundef %20, i8* noundef nonnull %4) #7
  br label %22

22:                                               ; preds = %9, %18
  %23 = phi i8* [ %21, %18 ], [ null, %9 ]
  call void @llvm.lifetime.end.p0i8(i64 19, i8* nonnull %4) #5
  ret i8* %23
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: optsize
declare hidden i8* @__randname(i8* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: optsize
declare i8* @strcpy(i8* noundef, i8* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 132953}
